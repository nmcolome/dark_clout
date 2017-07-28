class UploadLogicHelper

  def initialize(current_user)
    @user = current_user
  end

  def topwords
    topwords = {}
    topwords[:adjectives] = topword_adjectives
    topwords[:nouns] = topword_nouns
    topwords
  end


  private
  attr_reader :user

  def topword_nouns
    list = MetaDataFile.where(user_id: user.id)
    top_nouns = extract_words(list, "top_nouns")
    rank_words(top_nouns)
  end

  def topword_adjectives
    list = MetaDataFile.where(user_id: user.id)
    top_adjectives = extract_words(list, "top_adjectives")
    rank_words(top_adjectives)
  end

  def extract_words(list, type)
    output = []
    list.each do |data|
      words_array = []
      if type == "top_adjectives"
        words_array = data.top_adjective
      elsif type == "top_nouns"
        words_array = data.top_noun
      end
      words_array.each do |word|
        output << word
      end
    end
    output
  end

  def rank_words(words)
    words_ranking = Hash.new(0)
    words.each do |word|
      words_ranking[word] += 1
    end
    words_ranking
  end
end