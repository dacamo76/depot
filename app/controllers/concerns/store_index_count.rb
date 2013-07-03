module StoreIndexCount
  extend ActiveSupport::Concern

  private

    def count
      if session[:count].nil?
        @count = 1
      else
        @count = session[:count] + 1
      end
      session[:count] = @count
    end                                                                                                                                                 

  def reset_count
    session[:count] = 0
  end
end
