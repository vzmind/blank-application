require 'fileutils'

class Admin::CkToolsController < Admin::ApplicationController
  
  #TODO translate & DOC
  def config_file 
    config_file = String.new
    
    config_file += "CKEDITOR.editorConfig = function( config ) { "
    config_file += "config.language = '#{I18n.locale.split('-')[0]}';"
  	config_file += "config.uiColor = '#e6e6e6';"
  	config_file += "config.toolbar = 'BlankToolbar';"
    config_file += "config.height = '400';"
  	config_file += "config.width = '620';"
  	config_file += "config.resize_maxWidth = 608;"
  	config_file += "config.resize_minWidth = 608;"
  	config_file += "config.toolbarCanCollapse = false;"   

  	config_file += "config.toolbar_BlankToolbar = ["
  	params[:new] == "true" ? config_file += "[" : config_file += "['Save',"
  	config_file += "'Source','Undo','Redo','-','Bold','Italic','Underline','NumberedList','BulletedList','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','Find','Replace'],"
  	config_file += "['Anchor','Link','Unlink','Table','SpecialChar','Styles','FontSize','TextColor','BGColor', '-','Maximize']];"

  	config_file += "config.filebrowserWindowWidth = '640';"
    config_file += "config.filebrowserWindowHeight = '480';"
    
    config_file += "};"
    
    render :text => config_file, :layout => false
  end
  
  # Action allowing to upload files with FCKeditor
	#
  # This function is linked to an url accessible from the views.
	# It is uploading the files selected with FCKeditor inside the good folder.
  def upload_from_ck
    begin
      case params[:type]
        when "image"
          message = upload_image(params)
        when "video"
          message = upload_video(params)
        when "audio"
          message = upload_audio(params)
        else
          message = "no type available"
      end
          
      render :text => message
    rescue Exception => e
      logger.error(e.to_s + "\n" + e.backtrace.collect { |trace|' ' + trace + "\n" }.to_s)
      #TODO -> display error in notice on top (or error in fck erorrs) 
      render :text => "<script type='text/javascript'>window.parent.itemUploadComplete('error during transfert');</script>", :layout => false
    end
  end
  
  def tabs
    render :partial => "/admin/ck_specifics/ck_#{params[:tab_name]}"
  end
  
  def ajax_item_save
    #TODO translate & DOC
    @current_object = params[:item_type].classify.constantize.find(params[:id])
		if @current_object.update_attribute("body", params[:content])
		  message = "ok"
		else
		  message = "unable to save"
		end
		
		render :text => message
  end
  
  def ajax_workspace_save
    #TODO CONTAINER translate & DOC
    @current_object = Workspace.find(params[:id])
  	if @current_object.update_attribute("description", params[:content])
  	#if current_workspace.update_attribute("description", params[:content])
  	  message = "ok"
  	else
  	  message = "unable to save"
  	end

  	render :text => message
  end
  
  protected

  def upload_image(prms)
    #Create a new image
    #TODO translate "uploaded from FCK"
    uploaded_image = Image.new( :title => prms[:upload].original_filename,
                                :description => "uploaded from FCK",
                                :image => prms[:upload].to_s,
                                :user_id => current_user.id,
                                :image_file_name => prms[:upload].original_filename,                                    
                                :image => prms[:upload]
                                )
    #TODO : clean this code
    #associate the image in the private of the current user and in the current workspace (if ther is one)
    if prms[:ws_id].nil?
      uploaded_image.associated_workspaces = [@current_user.get_private_workspace]
    else
      uploaded_image.associated_workspaces = [@current_user.get_private_workspace, prms[:ws_id]]
    end
    
    uploaded_image.save
    
    img_tag = '<img src="' + uploaded_image.image.url + '"/>'
  
    return "<script type=\"text/javascript\">window.parent.itemUploadComplete('#{img_tag}');</script>"
  end

  def upload_video(prms)
    uploaded_video = Video.new( :title => params[:upload].original_filename,
                                :description => "uploaded from FCK",
                                :video => params[:uplaod].to_s,
                                :user_id => current_user.id,
                                :video_file_name => params[:upload].original_filename,                                    
                                :video => params[:upload],
                                :state => 'uploaded'
                              )
    if params[:ws_id].nil?
      uploaded_video.associated_workspaces = [@current_user.get_private_workspace]
    else
      uploaded_video.associated_workspaces = [@current_user.get_private_workspace, params[:ws_id]]
    end
    
    uploaded_video.save

		vdo_tag =  '<embed width="370" height="257" '
		vdo_tag += 'flashvars="&image=' + File.dirname(uploaded_video.video.url)
		vdo_tag += '/2.png&file=' + File.dirname(uploaded_video.video.url)
		vdo_tag += '/video.flv" allowfullscreen="true" allowscriptaccess="always" quality="high" src="/players/videoplayer.swf" type="application/x-shockwave-flash"/>'
		
		return "<script type=\"text/javascript\">window.parent.itemUploadComplete('#{vdo_tag}');</script>"
  end
  
  def upload_audio(prms)
    uploaded_audio = Audio.new( :title => params[:upload].original_filename,
                                :description => "uploaded from FCK",
                                :audio => params[:uplaod].to_s,
                                :user_id => current_user.id,
                                :audio_file_name => params[:upload].original_filename,                                    
                                :audio => params[:upload],
                                :state => 'uploaded'
                              )
    if params[:ws_id].nil?
      uploaded_audio.associated_workspaces = [@current_user.get_private_workspace]
    else
      uploaded_audio.associated_workspaces = [@current_user.get_private_workspace, params[:ws_id]]
    end
    
    uploaded_audio.save
    
    audio_tag = '<embed allowfullscreen="true" allowscriptaccess="always" quality="high"'
		audio_tag += ' flashvars="&playerID=1&soundFile=' + uploaded_audio.path_to_encoded_file
		audio_tag += '" src="/players/audioplayer.swf" type="application/x-shockwave-flash"/>'
  
		return "<script type=\"text/javascript\">window.parent.itemUploadComplete('#{audio_tag}');</script>"
  end
end
