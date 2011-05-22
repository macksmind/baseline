#!/usr/bin/ruby -w
unless Kernel.respond_to?(:require_relative)
  module Kernel
    def require_relative(path)
      require File.join(File.dirname(caller[0]), path.to_str)
    end
  end
end

require_relative File.join("lib","baseline.rb")

Baseline.new.generate!
