DROP TABLE IF EXISTS property_trackers;

CREATE TABLE property_trackers (
  id SERIAL8 PRIMARY KEY,
  address VARCHAR(255),
  value VARCHAR(255),
  number_of_bedrooms VARCHAR(255),
  year_built VARCHAR(255)
);
