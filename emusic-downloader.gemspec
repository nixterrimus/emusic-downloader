# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{emusic-downloader}
  s.version = "0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nicholas Rowe"]
  s.date = %q{2010-03-30}
  s.default_executable = %q{emusic}
  s.description = %q{Download eMusic .emz files}
  s.email = %q{nixterrimus@gmail.com}
  s.executables = ["emusic"]
  s.extra_rdoc_files = ["bin/emusic", "lib/emusic.rb"]
  s.files = ["Manifest", "Rakefile", "bin/emusic", "emusic-downloader.gemspec", "lib/emusic.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://nickrowe.info}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Emusic-downloader", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{emusic-downloader}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Download eMusic .emz files}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
