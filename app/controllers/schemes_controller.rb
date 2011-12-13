class SchemesController < ApplicationController

  before_filter :authenticate

  def new
    @title = 'Make a new scheme - skeemah'
    @scheme = Scheme.new
  end

end
