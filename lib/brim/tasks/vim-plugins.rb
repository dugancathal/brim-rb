require 'erb'

module Brim
  class VimPlugins < ::Thor
    include Thor::Actions
    namespace :"vim-plugins"

    desc "#{namespace}:setup", "Setup your vim directory for pathogen"
    def setup
      say "Installing vim-pathogen", :blue
      if not File.exists?('~/.vim/bundle')
        mute { run "mkdir -p ~/.vim/autoload ~/.vim/bundle; \
                 curl -Sso ~/.vim/autoload/pathogen.vim \
                   https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim" }
        say "Complete", :green
      else
        say "Previously installed", :red
      end
    end
  
    desc "#{namespace}:install REPO", "Install a git hosted vim-plugin"
    def install repo
      reponame = repo.match(/\/(.*).git/)[1]
      repopath = repo.match(/github.com/) ? repo : "http://github.com/#{repo}"
      
      say "Installing #{reponame}", :blue
      mute { run "git clone #{repopath} ~/.vim/bundle/#{reponame}" }
      say "Complete", :green
    end

    desc "#{namespace}:remove PLUGIN", "Remove a plugin from your bundle"
    def remove plugin
      mute { run "rm -r ~/.vim/bundle/#{plugin}" }
      say "Removed #{plugin}", :red
    end

    desc "#{namespace}:list", "Show a list of your installed plugins"
    def list
      mute { run "ls ~/.vim/bundle" }
    end
  
    private

    def mute &block
      self.shell.mute &block
    end
    
    def self.source_root
      File.expand_path('../../templates', __FILE__)
    end
  
    def filetime
      Time.now.strftime('%Y%m%d%H%M%S')
    end
  end
end
