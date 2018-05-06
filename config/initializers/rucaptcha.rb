RuCaptcha.configure do
  self.cache_store = :mem_cache_store
  # Chars length, default: 5, allows: [3 - 7]
  self.length = 4
end
