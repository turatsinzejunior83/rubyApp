class ResumesController < ApplicationController   
  def index   
     @resumes = Resume.all   
  end   
     
  def new   
     @resume = Resume.new   
  end   
     
  def create   
     @resume = Resume.new(resume_params)   
       respond_to do|format| 
     if @resume.save 
      format.html { redirect_to resumes_path, notice: 'Resume was Successfully uploaded.'}  
      format.json { render :show, status: :created, location: @resume}
         
     else   
        format.html {render :new } 
        format.json { render json: @resume.errors, status: :unprocessable_entity }
     end   
    end  
  end   
     
  def destroy   
     @resume = Resume.find(params[:id])   
     @resume.destroy   
     redirect_to resumes_path, notice:  "Successfully deleted."   
  end   
     
  private   
     def resume_params   
     params.require(:resume).permit(:title, :category, :year, :price, :attachment)   
  end   
     
end  