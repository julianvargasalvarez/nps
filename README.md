# NPS service api

The project uses Docker and Compose, to setup run:
```bash
sudo docker-compose run web bundle exec rails db:create db:migrate
sudo docker-compose up
```

To send data to the service run:
```bash
curl -XPOST -H "Content-Type: application/json" http://localhost:3000/scores -d '{"score": {"score":3,"touchpoint":"realtor_feedback", "respondent_id":1,"object_class":"realtor"}}'
```
To see the differnt validations performed my the service, remove fields or change the score values from the request.

To retrieve data from the service run:
```bash
curl -XGET -H "Content-Type: application/json" http://localhost:3000/scores_report -d '{"score": {"touchpoint":"realtor_feedback","respondent_class":"seller","object_class":"realtor"}}'
```
optional fields are respondent_class and object_class
