class PagesController < ApplicationController
    def home
        @hello_world = "Hello, world!"
    end

    def about
    end
end