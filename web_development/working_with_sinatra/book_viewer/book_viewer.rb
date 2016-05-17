require "tilt/erubis"
require "sinatra"
require "sinatra/reloader" if development?

before do
  @toc = File.readlines "data/toc.txt"
end

helpers do
  # def in_paragraphs(chapter_content)
  #   chapter_content.split("\n\n").map {|e| "<p>#{e}<p/>" }.join
  # end 

  def in_paragraphs(text)
    text.split("\n\n").each_with_index.map do |line, index|
      "<p id=paragraph#{index}>#{line}</p>"
    end.join
  end

  def highlight(text, search_term)
    text.gsub(search_term, "<strong>#{search_term}</strong>")
  end

end

not_found do
  redirect '/'
end

get "/" do
   @title = "My Name is Bob!!"
   erb :home
end

get "/chapters/:number" do
  chapter_number = params[:number]
  chapter_name = @toc[chapter_number.to_i + 1]
  @title = "Chapter #{chapter_number} : #{chapter_name}"
  @chapter = File.read("data/chp#{chapter_number}.txt")
  # @chapter = File.foreach("data/chp#{chapter_number}.txt", "\n\n").map(&:rstrip)
  erb :chapter
end

get '/search' do
  if params[:query]
    # each result in this array will be:
    # [ chapter name, chapter index, paragraph index ]
    @results = @toc.each_with_index.each_with_object([]) do |(chapter, index), results|
      text = File.read("data/chp#{index + 1}.txt")
      paragraphs = text.split("\n\n")
      paragraphs.each_with_index do |paragraph, paragraph_index|
        if paragraph.include?(params[:query])
          results << [chapter, index, paragraph, paragraph_index]
        end
      end
    end
  end
  # ********
  # if params[:query]
  #   @file_hits = @toc.each_with_index.select do |_, index|
  #     text = File.read("data/chp#{index + 1}.txt")
  #     search_paragraphs(text)   
  #   end
  # end

  # def search_paragraphs(text)
  #   paragraphs = text.downcase.split("/n/n")
  #   paragraphs.any? do |paragraph|
  #     paragraph.include?(params[:query].downcase)
  #   end
  # end
  # ********


  # if params[:query]
  #   search_item = params[:query].downcase 
   
  #   @array_of_data_files = Dir.glob("data/*")
  #   file_hits = @array_of_data_files.select do |file|
  #     File.read(file).downcase.include?(search_item)
  #   end

  #   @results = file_hits.map { |file| File.basename(file) }
  #   @chapter_numbers = @results.map { |file_name| file_name.scan(/\d/).join} 

  #   @search_hit_chapter_titles = []
  #   @chapter_numbers.each do |chapter_number|
  #     unless chapter_number.to_i == 0
  #       @search_hit_chapter_titles << @toc[chapter_number.to_i - 1]
  #     end
  #   end
  # end
  # ********

  erb :search
end



