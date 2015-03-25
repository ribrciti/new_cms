class SubjectsController < ApplicationController

  layout false

  #layout "admin"

  def index
    @subjects = Subject.sorted    # sorted comes from our previously defined scope in our model
  end

  def show
    @subject = Subject.find(params[:id])  #singular use of subjects, and params
  end

  def new
    @subject = Subject.new({:name => "Default"})
  end

  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      # If save succeeds, redirect to the index aciton ## add flash hash
      flash[:notice] = "Subject created successfully"
      redirect_to(:action => 'index')
     else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
  
  def edit
     @subject = Subject.find(params[:id])     #same exact code from show above
  end

  def update
    # Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
      # If update succeeds, redirect to the index aciton    ## Add flash hash
      flash[:notice] = "Subject created successfully"
      redirect_to(:action => 'show',:id => @subject.id)
     else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
     @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    ## Add flash   hash
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully"
    redirect_to(:action => 'index')   
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :position, :visible, :created_at )
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned!!!
    end
end
