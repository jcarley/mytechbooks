namespace :books do

  desc "Imports books from isbn_of_books.txt"
  task :import => :environment do

    file_name = "isbn_of_books.txt"
    # file_name = "isbn_of_books_test.txt"
    failed_import_file_name = "failures.txt"

    errors = File.open(failed_import_file_name, "w")

    file = File.open(file_name) do |file|
      lines = file.readlines

      amz = Services::AmazonSimpleSearch.new

      puts "Total Items: #{lines.count}"
      lines.each_with_index do |line, index|
        sleep 5
        puts "Processing item: #{index + 1} of #{lines.count}"
        items = amz.query(line)
        begin
          book = Book.from_amz_item(items.first)
          book.save!
          puts book.title
        rescue Exception => e
          puts "Error: #{line}"
          errors.puts "Error: #{line} #{e.message}"
        end
      end
    end

    errors.flush
    errors.close unless errors.closed?
  end

end
