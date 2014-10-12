require 'minitest/autorun'
require_relative '../lib/downloads_sorter.rb'
class DownloadsSorterTest < MiniTest::Test
  TEST_PATH = File.join("tmp", "Downloads")
  
  def setup
    unless Dir.exists?("tmp")
      Dir.mkdir("tmp")
    end
    unless Dir.exists?(TEST_PATH)
      Dir.mkdir(TEST_PATH)
    end
    seed_folder
  end

  def teardown
    Dir.chdir(TEST_PATH) do
      `rm -rf Images` if Dir.exists?('Images')
      `rm -rf Documents` if Dir.exists?('Documents')
      `rm -rf Audio` if Dir.exists?('Audio')
    end
  end

  def seed_folder
    Dir.chdir(TEST_PATH) do
      %w{ file1.png file2.pdf file3.jpeg file4.txt file5.docx file6.xlsx file7.csv file.dump file.mp3 file.mp4 }.each do |file|
        File.new(file, 'w+')
      end
    end
  end
  
  def test_finds_the_downloads_folder
    ds = DownloadsSorter.new(TEST_PATH)
    assert_equal(TEST_PATH, ds.dir_path)
  end

  def test_raises_error_if_no_downloads
    assert_raises(NoPathError) { DownloadsSorter.new("tmp/Uploads") }
  end

  def test_moves_files_to_respective_directories
    ds = DownloadsSorter.new(TEST_PATH)
    ds.sort
    assert(true, File.exists?("tmp/Downloads/Images/file1.png"))
    assert(true, File.exists?("tmp/Downloads/Documents/file5.docx"))
    Dir.chdir(TEST_PATH) do
      assert(1, Dir.glob("*").count)
    end
  end

end
