module Users
  class IndexPresenter
    attr_reader :users

    def initialize(users)
      @users = users
    end
  end
end