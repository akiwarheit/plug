class NotebooksController < ApplicationController
  # GET /notebooks
  # GET /notebooks.xml
  def index
    @notebooks = Notebook.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notebooks }
    end
  end

  # GET /notebooks/1
  # GET /notebooks/1.xml
  def show
    @notebook = Notebook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @notebook }
    end
  end

  # GET /notebooks/new
  # GET /notebooks/new.xml
  def new
    @notebook = current_user.notebooks.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @notebook }
    end
  end

  # GET /notebooks/1/edit
  def edit
    @notebook = Notebook.find(params[:id])
  end

  # POST /notebooks
  # POST /notebooks.xml
  def create
    @notebook = current_user.notebooks.build(params[:notebook])

    respond_to do |format|
      if @notebook.save
        format.html { redirect_to(@notebook, :notice => 'Notebook was successfully created.') }
        format.xml  { render :xml => @notebook, :status => :created, :location => @notebook }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @notebook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notebooks/1
  # PUT /notebooks/1.xml
  def update
    @notebook = Notebook.find(params[:id])

    respond_to do |format|
      if @notebook.update_attributes(params[:notebook])
        format.html { redirect_to(@notebook, :notice => 'Notebook was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @notebook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notebooks/1
  # DELETE /notebooks/1.xml
  def destroy
    @notebook = Notebook.find(params[:id])
    @notebook.destroy

    respond_to do |format|
      format.html { redirect_to(notebooks_url) }
      format.xml  { head :ok }
    end
  end
end
