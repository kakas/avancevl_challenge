# frozen_string_literal: true

# ref: https://www.greyblake.com/blog/2014-10-05-lazy-object-pattern-in-ruby/
class LazyObject < ::BasicObject
  def initialize(&callable)
    @callable = callable
  end

  def __target_object__
    @__target_object__ ||= @callable.call
  end

  def method_missing(method_name, *args, &block)
    __target_object__.send(method_name, *args, &block)
  end
end
