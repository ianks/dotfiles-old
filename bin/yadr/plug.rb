require 'fileutils'

module Plug
  @plugs_path = File.expand_path File.join(ENV['HOME'], '.vim', '.plugs.local')
  def self.add_plugin_to_plug(plugin_repo)
    return if contains_plug? plugin_repo

    plugs = plugs_from_file
    last_bundle_dir = plugs.rindex{ |line| line =~ /^Plug / }
    last_bundle_dir = last_bundle_dir ? last_bundle_dir+1 : 0
    plugs.insert last_bundle_dir, "Plug \"#{plugin_repo}\""
    write_plugs_to_file plugs
  end

  def self.remove_plugin_from_plug(plugin_repo)
    plugs = plugs_from_file
    deleted_value = plugs.reject!{ |line| line =~ /Plug "#{plugin_repo}"/ }

    write_plugs_to_file plugs

    !deleted_value.nil?
  end

  def self.plug_list
		plugs_from_file.select{ |line| line =~ /^Plug .*/ }.map{ |line| line.gsub(/Plug "(.*)"/, '\1')}
  end

  def self.update_plug
		system "vim --noplugin -u #{ENV['HOME']}/.vim/plugs.vim -N " \
			"\"+set hidden\" \"+syntax on\" +PlugClean +PlugInstall +qall"
  end


  private
  def self.contains_plug?(plug_name)
    FileUtils.touch(@plugs_path) unless File.exists? @plugs_path
    File.read(@plugs_path).include?(plug_name)
  end

  def self.plugs_from_file
    FileUtils.touch(@plugs_path) unless File.exists? @plugs_path
    File.read(@plugs_path).split("\n")
  end

  def self.write_plugs_to_file(plugs)
    FileUtils.cp(@plugs_path, "#{@plugs_path}.bak")
    plug_file = File.open(@plugs_path, "w")
    plug_file.write(plugs.join("\n"))
    plug_file.close
  end
end
