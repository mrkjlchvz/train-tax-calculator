require "train/tax/calculator/version"
require "train/tax/calculator/philhealth"
require "train/tax/calculator/pagibig"
require "train/tax/calculator/sss"
require "train/tax/calculator/deductions"
require "train/tax/calculator/withholding_tax"

module Train
  module Tax
    module Calculator

      def self.call(basic_salary)
        return 0.00 if basic_salary <= 0

        hash = Hash.new

        hash[:sss]              = Sss.(basic_salary)
        hash[:pagibig]          = Pagibig.(basic_salary)
        hash[:philhealth]       = Philhealth.(basic_salary)
        hash[:total_deductions] = Deductions.(basic_salary)
        hash[:withholding_tax]  = WithholdingTax.(basic_salary)
        hash[:net_income]       = (basic_salary - hash[:withholding_tax]).round(2)

        hash
      end

    end
  end
end
