class ContactListsController < ApplicationController
  before_action :set_contact_list, only: [:show, :edit, :update, :destroy]
  before_action :get_contact_list, only: [:show]

  # GET /contact_lists
  # GET /contact_lists.json
  def index
    @contact_lists = ContactList.all
  end

  # GET /contact_lists/new
  def new
    @contact_list = ContactList.new
  end

  # POST /contact_lists
  # POST /contact_lists.json
  def create
    @contact_list = ContactList.new(contact_list_params)

    respond_to do |format|
      if @contact_list.save
        if !!params[:contact_ids] 
          params[:contact_ids].each do |data|
            data = ContactListMapping.new(:contact_id => data, :contact_list_id => @contact_list.id)
            if data.valid?
              data.save
            else
              @errors += data.errors
            end
          end
        end
        format.html { redirect_to contact_lists_path, notice: 'Contact list was successfully created.' }
        format.json { render :show, status: :created, location: @contact_list }
      else
        format.html { render :new }
        format.json { render json: @contact_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_lists/1
  # PATCH/PUT /contact_lists/1.json
  def update
    respond_to do |format|
      if @contact_list.update(contact_list_params)
      if !!params[:contact_ids]
        params[:contact_ids].each do |contacts|
          contacts = ContactListMapping.new(:contact_id => contacts, :contact_list_id => @contact_list.id)
          if contacts.valid?
            contacts.save
          else
            @errors += contacts.errors
          end
        end
      end  
        format.html { redirect_to @contact_list, notice: 'Contact list was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_list }
      else
        format.html { render :edit }
        format.json { render json: @contact_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_lists/1
  # DELETE /contact_lists/1.json
  def destroy
    @contact_list.destroy
    respond_to do |format|
      format.html { redirect_to contact_lists_url, notice: 'Contact list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_list
      @contact_list = ContactList.find(params[:id])
    end
    def get_contact_list
      @contact_list_contacts = @contact_list.contacts
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_list_params
      params.require(:contact_list).permit(:name)
    end
end
