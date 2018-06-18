Braze API Wrapper
======================

This repo contains a simple API wrapper/interface for basic Braze functionality.

In order to use the Braze API, you will need a Braze account with an API key and
the correct url endpoint for your Braze instance (https://www.braze.com/documentation/REST_API/#send-endpoints)

To initialize an API object, use:

```
Braze::Api.new(api_key: '<your api key>', endpoint_url: '<your endpoint url>')
```

Once initialized, you can call API functions using this object. For instance, to
find all of the external ids associated to a particular email in Braze, use:

```
braze_api = Braze::Api.new(api_key: '<your api key>', endpoint_url: '<your endpoint url>')
Braze::Users.export_ids(braze_api, '<email address>')
```

A Braze profile model is included in this repo for assistance in working with creating
and updating user profiles. The model will automatically output the correct attributes
hash for an insert/update profile call via the `.attributes` method:

```
braze_api = Braze::Api.new(api_key: '<your api key>', endpoint_url: '<your endpoint url>')
profiles = Braze::Users.fetch_profiles(braze_api, email)
profiles.each { |profile| profile.last_name = 'TEST' }
profiles.each { |profile| Braze::Users.upsert_profile(braze_api, profile.attributes) }
```
