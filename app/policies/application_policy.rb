class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def dashboard?
    user.admin
  end

  def index?
    user.admin
  end

  def new?
    user.admin
  end

  def export?
    user.admin
  end

  def destroy?
    user.admin
  end

  def edit?
    user.admin
  end

  def show?
    user.admin
  end

  def show_in_app?
    user.admin
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
