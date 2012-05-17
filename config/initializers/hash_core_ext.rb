
ActiveSupport.on_load(:after_initialize) do
  Hash.class_eval do
    alias_method :mash, :with_indifferent_access

    def mash!
      other = mash
      clear.update(other)
    end
  end
end

