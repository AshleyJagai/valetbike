module ApplicationHelper


    def show_validation_errors(object)
        render(partial: 'layouts/error_messages', locals: {object: object})
    end 


end
