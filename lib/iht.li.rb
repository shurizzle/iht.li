#--
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# Version 2, December 2004
#
# Copyleft shura [shura1991@gmail.com]
#
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
# 0. You just DO WHAT THE FUCK YOU WANT TO.
#++

require 'net/http'

module IHT
  def self.li
    ::IHT::LI
  end

  module LI
    LANGUAGES = ['text', 'abap', 'actionscript', 'ada', 'apache', 'applescript',
      'asm', 'asp', 'autoit', 'bash', 'basic4gl', 'bf', 'blitzbasic', 'bnf',
      'c', 'c_mac', 'caddcl', 'cadlisp', 'cfdg', 'cfm', 'cil', 'cobol', 'cpp-qt',
      'cpp', 'csharp', 'css', 'd', 'delphi', 'diff', 'div', 'dos', 'dot',
      'eiffel', 'fortran', 'freebasic', 'genero', 'gettext', 'glsl', 'gml',
      'gnuplot', 'groovy', 'haskell', 'hq9plus', 'html4strict', 'idl', 'ini',
      'inno', 'intercal', 'io', 'java', 'java5', 'javascript', 'kixtart',
      'klonec', 'klonecpp', 'latex', 'lisp', 'lolcode', 'lotusscript', 'lua',
      'm68k', 'make', 'matlab', 'mirc', 'mxml', 'mpasm', 'mysql', 'nsis', 'objc',
      'ocaml-brief', 'ocaml', 'oobas', 'oracle8', 'oracle11', 'pascal', 'per',
      'perl', 'php-brief', 'php', 'pixelbender', 'plsql', 'povray', 'powershell',
      'progress', 'prolog', 'providex', 'python', 'qbasic', 'rails', 'reg',
      'robots', 'ruby', 'sas', 'scala', 'scheme', 'scilab', 'sdlbasic',
      'smalltalk', 'smarty', 'sql', 'tcl', 'teraterm', 'thinbasic', 'tsql',
      'typoscript', 'vb', 'vbnet', 'verilog', 'vhdl', 'vim', 'visualfoxpro',
      'visualprolog', 'whitespace', 'winbatch', 'xml', 'xorg_conf', 'xpp', 'z80']

    def self.shorter(url)
      Net::HTTP.post_form(URI.parse('http://iht.li/add_url.php'), {'url' => url}).body.strip
    end

    def self.nopaste(text, lang='text', author='NoBody', title='NoTitle', password=nil)
      raise 'Language doesn\'t exist' unless LANGUAGES.include?(lang)

      params = {
        'text'      => text,
        'language'  => lang,
        'author'    => author,
        'title'     => title,
        'private'   => '0',
        'password'  => ''
      }

      if password
        params['private'] = '1'
        params['password'] = password
      end

      Net::HTTP.post_form(URI.parse('http://iht.li/add_paste.php'), params).body.strip
    end
  end
end

def iht
  ::IHT
end
