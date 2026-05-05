class GoogleReviewsService
  PLACE_ID = "ChIJN0VEfcH0WYgRx3Y9I6LJWDQ" # Italian Garden Restaurant, York SC
  CACHE_KEY = "google_reviews"
  CACHE_DURATION = 24.hours

  def self.fetch
    # Return cached reviews if available
    cached = Rails.cache.read(CACHE_KEY)
    return cached if cached.present?

    return fallback_reviews unless api_key.present?

    reviews = fetch_from_api
    Rails.cache.write(CACHE_KEY, reviews, expires_in: CACHE_DURATION)
    reviews
  rescue => e
    Rails.logger.error("Google Reviews fetch failed: #{e.message}")
    fallback_reviews
  end

  def self.fetch_from_api
    response = Faraday.get("https://maps.googleapis.com/maps/api/place/details/json", {
      place_id: PLACE_ID,
      fields: "reviews,rating,user_ratings_total",
      key: api_key,
      reviews_sort: "newest"
    })

    data = JSON.parse(response.body)
    return fallback_reviews unless data["status"] == "OK"

    reviews = data.dig("result", "reviews") || []
    {
      rating: data.dig("result", "rating"),
      total: data.dig("result", "user_ratings_total"),
      reviews: reviews.first(5).map do |r|
        {
          author: r["author_name"],
          rating: r["rating"],
          text: r["text"],
          time: Time.at(r["time"]).strftime("%B %Y"),
          profile_photo: r["profile_photo_url"]
        }
      end
    }
  end

  def self.fallback_reviews
    {
      rating: 4.5,
      total: 85,
      reviews: [
        { author: "Donna G.", rating: 5, text: "The chicken fettuccine Alfredo is the best I've ever had. Creamy, rich, and the portions are huge.", time: "Recent" },
        { author: "Will B.", rating: 5, text: "Best wings in York, hands down. Crispy, bold flavor, and they don't skimp on the size.", time: "Recent" },
        { author: "Angel M.", rating: 5, text: "Family-owned and you can feel it. The staff treats you like family, the food is always on point.", time: "Recent" }
      ]
    }
  end

  def self.api_key
    ENV["GOOGLE_PLACES_API_KEY"]
  end
end
