FactoryGirl.define do
  factory :movie do
    title "Saving Private Ryan"
    year 1998
    poster_url "/gc7IN6bWNaWXv4vI6cxSmeB7PeO.jpg"
    rating 8.6
    imdb_url "0111161"

    factory :for_a_few_dollars_more do
      title "For a Few Dollars More"
      year 1965
      poster_url "/3jblmNz3pCdNBpdCQvD08lx7d4v.jpg"
      rating 8.4
      imdb_url "0059578"
    end
  end
end
