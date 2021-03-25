class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def show
    @job = Job.find(params[:id])
     @jobs = Job.paginate(:page => params[:page], :per_page => 5)

    if @job.is_hidden
      flash[:warning] = "This Job already archived"
      redirect_to root_path
    end
  end

  def index
    @jobs = case params[:order]
            when 'by_lower_bound'
              Job.published.order('wage_lower_bound DESC')
            when 'by_upper_bound'
              Job.published.order('wage_upper_bound DESC')
            else
              Job.published.recent
            end
            if params[:search]
        @jobs = Job.search(params[:search]).recent.paginate(:page => params[:page], :per_page => 5)
      else
        @jobs = Job.all.recent.paginate(:page => params[:page], :per_page => 5)
      end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy

    redirect_to jobs_path
  end

  def search
    if @query_string.present?
      # 显示符合关键字的公开职位 #
      search_result = Job.joins(:location).ransack(@search_criteria).result(:distinct => true)
      @jobs = search_result.published.paginate(:page => params[:page], :per_page => 10 )
      # 随机推荐五个职位 #
      @suggests = Job.published.random5
    end
  end

  protected

  def validate_search_key
    # 去除特殊字符 #
    @query_string = params[:keyword].gsub(/\\|\'|\/|\?/, "") if params[:keyword].present?
    @search_criteria = search_criteria(@query_string)

  end

  def search_criteria(query_string)
    # 筛选多个栏位 #
    { :name_or_company_or_location_name_cont => query_string }
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden, :requirement, :search)
  end
end
