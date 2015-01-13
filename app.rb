require("sinatra")
require("sinatra/reloader")
also_reload("/lib/**/*.rb")
require("./lib/job_history")


get("/") do
  @input = Employment.all()
  erb(:form)
end

post("/input") do
  employer = params.fetch("employer")
  job_title = params.fetch("job_title")
  start_date = params.fetch("start_date")
  end_date = params.fetch("end_date")
  job = Employment.new(employer, job_title, start_date, end_date)
  job.save()
  erb(:success)
end
