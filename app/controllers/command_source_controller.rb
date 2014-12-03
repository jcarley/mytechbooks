class CommandSourceController < ApplicationController
  def index
    @command_source = CommandSource.all
  end
end
