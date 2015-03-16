# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# bcrypt hash of "password"
password_digest = "$2a$10$JWSaLYpe09o6B9G1B9mXoOlbzBdqlJfvpGcCA/aerLp7iltDmn6jK"

User.create!([
  { id: 1, email: 'monkey@monkeytasks.com', password_digest: password_digest },
  { id: 2, email: 'tsavo@monkeytasks.com' , password_digest: password_digest },
  { id: 3, email: 'noche@monkeytasks.com' , password_digest: password_digest }
])