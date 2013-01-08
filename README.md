BRIM
====

A Thor-based implementation of brim.
brim - bash/ruby/vim.  

Setup
-----

Until I get off my rear and put this on rubygems, you'll have to install this the hard way.

    git clone git@github.com/dugancathal/brim-rb
    cd brim-rb
    rake install
    brim vim-plugins setup

Usage
-----

Currently, there are three primary operations supported: project creation, templating, and vim plugins using Pathogen <http://github.com/tpope/vim-pathogen>.

Project creation creates a project directory similar to `bundle gem`.

    $ brim project:new project

The templating is accomplished like so:

    $ brim migration:create_table products # => creates a db/migrate/(TIME)_create_products.rb file
    $ brim tdd:minitest products           # => creates a test/(PROJECT_NAME)/products_test.rb file

Vim Plugins can be installed as such:
    $ brim vim-plugins install tpope/vim-pathogen.git
    $ brim vim-plugins install git@github.com:superjudge/tasklist-pathogen.git

More to come
