# # encoding: utf-8

# Inspec test for recipe hands_on_with_habitat::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe command('hab') do
  it { should exist }
end

describe user('hab') do
  it { should exist }
end

describe group('hab') do
  it { should exist }
end
