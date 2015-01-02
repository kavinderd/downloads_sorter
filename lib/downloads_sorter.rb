require 'fileutils'
class NoPathError < Exception; end;

class DownloadsSorter
  VERSION = "0.0.2"
  PATH = File.join(Dir.home, "Downloads")
  Images = %w{ *.jpg *.png *.jpeg}
  Documents = %w{ *.pdf *.doc *.docx *.txt}
  Audio = %w{ *.mp3 }
  Books = %w{ *.epub }
  Apps = %w{ *.dmg }
  Archives = %w{ .zip .tar .gzip}
  SUB_DIRS = %w{ Images Documents Audio Books Apps Archives}
  
  
  attr_reader :dir_path
  def initialize(dir_path)
    raise NoPathError unless Dir.exists?(dir_path)
    @dir_path = dir_path
    check_or_create_dirs
  end

  def sort
    Dir.chdir(@dir_path) do
      SUB_DIRS.each do |dir|
        move_files_to_sub_dir(dir, DownloadsSorter.const_get(dir))
      end
    end
  end

  private

  def check_or_create_dirs
    SUB_DIRS.each do |dir|
      unless Dir.exists?(File.join(dir_path, dir))
        Dir.mkdir(File.join(dir_path, dir))
      end
    end
  end

  def move_files_to_sub_dir(path, types)
    files = types.map { |type| Dir.glob(type) }.flatten
    if files.any?
      files.each do |file|
        FileUtils.mv(file, path)
      end
    end 
  end

end
