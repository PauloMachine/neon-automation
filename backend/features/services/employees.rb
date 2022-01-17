module Rest
  class Employees
    include HTTParty

    headers 'Content-Type' => 'application/json'
    base_uri 'http://dummy.restapiexample.com/api/v1'

    def get_employees
      self.class.get('/employees')
    end

    def get_employee(id)
      self.class.get("/employee/#{id}")
    end
  end
end