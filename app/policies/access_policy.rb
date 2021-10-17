AccessPolicy = Struct.new(:user, :access) do
  def admin?
    user.has_role?(:admin)
  end
end
