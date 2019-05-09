# Boxify Shipit

This is an API based application that would make easier to calculate boxes sizes through certain inputs.

## Pre Requisites

* Ruby 2.6.1
* Rails 5.2.3
* Bundler >= 2.0

## Instalation

* clone project
  - `git clone https://github.com/shipit-team/shipit-boxify.git`
* install dependencies
  - `bundle install`

## Run

* `rails server` or simply `rails s`

------
## Test API

You can test the API endpoint by this methods (be aware that weight in not mandatory, it can be assumed as value=1):

### POST
https://boxify.shipit.cl/packs
- headers:
```
{
  "Content-Type": "application/json"
}
```
- body:
```
{
	"packages": [
		{
			"width": 20,
			"height": 15,
			"length": 5,
			"weight": 0.35,
			"quantity": 1
		},
		{
			"width": 10,
			"height": 30,
			"length": 8,
			"quantity": 4
		}
	]
}
```
- expected response:
```
{
    "packing_measures": {
        "length": 20,
        "width": 30,
        "height": 60,
        "weight": 4.35
    }
}
```