class Employment
  @@all_jobs = []

  define_method(:initialize) do |employer, job_title, start_year, end_year|
    @employer = employer
    @job_title = job_title
    @job_duration = start_year.+(" - ").+(end_year)
  end

  define_method(:employer_name) do
    @employer
  end

  define_method(:job_name) do
    @job_title
  end

  define_method(:job_length) do
    @job_duration
  end

  define_singleton_method(:all) do
    @@all_jobs
  end

  define_method(:save) do
    @@all_jobs.push(self)
  end

  define_singleton_method(:clear) do
    @@all_jobs = []
  end
end
