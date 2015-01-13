require('rspec')
require('job_history')


describe(Employment) do
  before() do
    Employment.clear()
  end

  describe("#employer_name") do
    it("gives the name of the employer") do
      test_job = Employment.new("Target", "Cashier", "2007", "2011")
      expect(test_job.employer_name()).to(eq("Target"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Employment.all()).to(eq([]))
    end
  end

  describe("#job_name") do
    it("gives the job title") do
      test_job = Employment.new("Target", "Cashier", "2007", "2011")
      expect(test_job.job_name()).to(eq("Cashier"))
    end
  end

  describe("#job_length") do
    it("gives the dates for employment") do
      test_job = Employment.new("Target", "Cashier", "2007", "2011")
      expect(test_job.job_length()).to(eq("2007 - 2011"))
    end
  end

  describe("#save") do
    it("adds new employment data to master list") do
      test_job = Employment.new("Target", "Cashier", "2007", "2011")
      test_job2 = Employment.new("Target", "Cashier", "2007", "2015")
      test_job.save()
      test_job2.save()
      expect(Employment.all()).to(eq([test_job, test_job2]))
    end
  end

  describe('.clear') do
    it("clears the employment history") do
      test_job = Employment.new("Target", "Cashier", "2007", "2011")
      test_job2 = Employment.new("Target", "Cashier", "2007", "2015")
      Employment.clear()
      expect(Employment.all()).to(eq([]))
    end
  end

end
