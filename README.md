# Puppy Health Api
 >Puppy Health api RESTful API that allows authenticated users to track their pet's eating habits, exercise, appointments, medication and overall health.

 ## Signup User
```
  axios.post("https://young-scrubland-44144.herokuapp.com/signup", {
      name: 'Pet Name',
      email: brittany@gmail.com,
      password: 12345,
      password_confirmation: 12345,
    })
  .then(response => console.log(response))
  .catch(error => console.log(error))
```
 ## Login User
```
  axios.post("https://young-scrubland-44144.herokuapp.com/auth/login",
    {
      email: brittany@gmail.com,
      password: 12345,
    }
  )
  .then(response => console.log(response))
  .catch(error => console.log(error))
```

 ## Create Food Entry
```
  const token = localStorage.getItem('token')
    const config = {
      headers: { Authorization: `Bearer ${token}` }
    };
        
     const foods = {
      brand: food.brand,
      amount: food.amount,
      date: food.date,
      time: food.time,
      user_id: food.user_id,
    };

  axios.post("https://young-scrubland-44144.herokuapp.com/api/v1/foods", foods, config)
  .then(response => console.log(response))
  .catch(error => console.log(error))
```

## Get All Food Entries
```
  const token = localStorage.getItem('token')
  axios.get("https://young-scrubland-44144.herokuapp.com/api/v1/foods",
    {
    headers: {
      Authorization: `Bearer ${token}`,
     },
  )
  .then(response => console.log(response))
  .catch(error => console.log(error))
```

 ## Create General Health Entry
```
  const token = localStorage.getItem('token')
    const config = {
      headers: { Authorization: `Bearer ${token}` }
    };
        
     const generalHealths = {
      weight: generalHealth.weight,
      energy_level: generalHealth.energy_level,
      hunger_level: generalHealth.hunger_level,
      date: generalHealth.date,
      user_id: generalHealth.user_id,
    };

  axios.post("https://young-scrubland-44144.herokuapp.com/api/v1/general_healths", generalHealths, config)
  .then(response => console.log(response))
  .catch(error => console.log(error))
```

## Get All General Health Entries
```
  const token = localStorage.getItem('token')
  axios.get("https://young-scrubland-44144.herokuapp.com/api/v1/general_healths",
    {
    headers: {
      Authorization: `Bearer ${token}`,
     },
  )
  .then(response => console.log(response))
  .catch(error => console.log(error))
```
 ## Create Medication Entry
```
  const token = localStorage.getItem('token')
    const config = {
      headers: { Authorization: `Bearer ${token}` }
    };
        
     const medications = {
      dosage: medication.dosage,
      name: medication.name,
      date: medication.date,
      time: medication.time,
      use: medication.use,
      user_id: medication.user_id,
    };

  axios.post("https://young-scrubland-44144.herokuapp.com/api/v1/medications", generalHealths, config)
  .then(response => console.log(response))
  .catch(error => console.log(error))
```

## Get All Medication Entries
```
  const token = localStorage.getItem('token')
  axios.get("https://young-scrubland-44144.herokuapp.com/api/v1/medications",
    {
    headers: {
      Authorization: `Bearer ${token}`,
     },
  )
  .then(response => console.log(response))
  .catch(error => console.log(error))
```

 ## Create Treats Entry
```
  const token = localStorage.getItem('token')
    const config = {
      headers: { Authorization: `Bearer ${token}` }
    };
        
     const treats = {
      amount: treat.amount,
      treat_type: treat.treat_type,
      date: treat.date,
      user_id: treat.user_id,
    };

  axios.post("https://young-scrubland-44144.herokuapp.com/api/v1/treats", treats, config)
  .then(response => console.log(response))
  .catch(error => console.log(error))
```

## Get All Treats Entries
```
  const token = localStorage.getItem('token')
  axios.get("https://young-scrubland-44144.herokuapp.com/api/v1/treats",
    {
    headers: {
      Authorization: `Bearer ${token}`,
     },
  )
  .then(response => console.log(response))
  .catch(error => console.log(error))
```
 ## Create Walks Entry
```
  const token = localStorage.getItem('token')
    const config = {
      headers: { Authorization: `Bearer ${token}` }
    };
        
     const walks = {
      date: walk.date,
      distance: walk.distance,
      time: walk.time,
      user_id: walk.user_id,
    };

  axios.post("https://young-scrubland-44144.herokuapp.com/api/v1/walks", walks, config)
  .then(response => console.log(response))
  .catch(error => console.log(error))
```

## Get All Walk Entries
```
  const token = localStorage.getItem('token')
  axios.get("https://young-scrubland-44144.herokuapp.com/api/v1/walks",
    {
    headers: {
      Authorization: `Bearer ${token}`,
     },
  )
  .then(response => console.log(response))
  .catch(error => console.log(error))
```
 ## Create Appointment Entry
```
  const token = localStorage.getItem('token')
    const config = {
      headers: { Authorization: `Bearer ${token}` }
    };
        
     const appointments = {
      time: appointment.time,
      appt_type: appointment.type,
      date: appointment.date,
      location: appointment.location,
      user_id: appointment.user_id,
    };

  axios.post("https://young-scrubland-44144.herokuapp.com/api/v1/appointments", appointments, config)
  .then(response => console.log(response))
  .catch(error => console.log(error))
```

## Get All Apppointment Entries
```
  const token = localStorage.getItem('token')
  axios.get("https://young-scrubland-44144.herokuapp.com/api/v1/appointments",
    {
    headers: {
      Authorization: `Bearer ${token}`,
     },
  )
  .then(response => console.log(response))
  .catch(error => console.log(error))
```

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4.4
## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Ruby: 2.6.3
- Rails: 5.2.4
- Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```



### Usage

Start server with:

```
    rails server
```


### Run tests

```
    rspec --format documentation
```

##  Unit Test

- Rspec


## Author

👤 **Brittany Blake**

- Github: [@BrittanyBlake](https://github.com/BrittanyBlake)
- Twitter: [@bbcodes_](https://twitter.com/bbcodes_)
- Linkedin: [Brittany Blake](https://www.linkedin.com/in/brittany-a-blake/)

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to <a href="https://microverse.org/">Microverse</a>