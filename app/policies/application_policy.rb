class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end
  
  def rails_admin?(action)
    case action
      when :dashboard
        user.admin_role?
      when :index
        user.admin_role?
      when :show
        user.admin_role?
      when :new
        user.admin_role?
      when :edit
        user.admin_role?
      when :destroy
        user.admin_role?
      when :export
        user.admin_role?
      when :history
        user.admin_role?
      when :show_in_app
        user.admin_role?
      else
        raise ::Pundit::NotDefinedError, "unable to find policy #{action} for #{record}."
    end
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
