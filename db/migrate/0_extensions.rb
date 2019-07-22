# frozen_string_literal: true

# Good extensions to always have
class Extensions < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto'
    enable_extension 'plpgsql'
    enable_extension 'uuid-ossp'
  end
end
