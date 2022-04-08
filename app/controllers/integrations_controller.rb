class IntegrationsController < ApplicationController
  include RegionHelper

  def index
    if uk?
      @integrations = [
        {
          title: "Back of House",
          link: integrations_backofhouse_path,
          image_path: "back_of_house.png",
          description: "Specialises in implementing software solutions for hospitality and retail.",
          type: :consulting
        },
        {
          title: "Brightpay",
          description: "Efficiently manage your payroll and fulfil your auto enrolment duties.",
          link: integrations_brightpay_path,
          image_path: "brightpay.png",
          type: :payroll
        },
        {
          title: "Clover",
          description: "Taps into your Clover sales data to build a data-driven schedule optimal for your business.",
          link: :call,
          image_path: "clover.png",
          type: :pos
        },
        {
          title: "Expend",
          description: "Manage expense claims for your team while automating receipt collection for your team.",
          link: :call,
          image_path: "expend.png",
          type: :na
        },
        {
          title: "Goodtill",
          description: "Pull sales data from Goodtill to create costed schedules that match your needs.",
          link: integrations_goodtill_path,
          image_path: "goodtill.png",
          type: :pos
        },
        {
          title: "ICR Touch",
          description: "Import sales data automatically for improved labour cost reporting rotas.",
          link: integrations_icr_touch_path,
          image_path: "icr_touch.png",
          type: :pos
        },
        {
          title: "Intuit QuickBooks",
          description: "Easily export timesheets into QuickBooks to simplify payroll processing.",
          link: :call,
          image_path: "quickbooks.png",
          type: :payroll
        },
        {
          title: "Kounta",
          description: "Strengthen your reporting and grow your business, combining sales data with your rotas.",
          link: :call,
          image_path: "kounta.png",
          type: :pos
        },
        {
          title: "Lightspeed Restaurant",
          description: "Sync sales from Lightspeed to build cost-optimised rotas and report on labour cost.",
          link: integrations_lightspeed_path,
          image_path: "lightspeed.png",
          type: :pos
        },
        {
          title: "Moneysoft",
          description: "Export your timesheet data collected in Workforce to Moneysoft, automating the calculation of overtime.",
          link: :call,
          image_path: "moneysoft.png",
          type: :payroll
        },
        {
          title: "Omnivore",
          description: "Connect Workforce to Omnivore's POS Integration Marketplace to import sales and order data.",
          link: :call,
          image_path: "omnivore.png",
          type: :pos
        },
        {
          title: "pointOne",
          description: "Connect pointOne for improved scheduling using our predictive demand tool and labour cost analytics.",
          link: :call,
          image_path: "pointone.png",
          type: :pos
        },
        {
          title: "Revel Systems",
          description: "Connect your sales data to build a predictive workforce™ model, automtically creating optimized schedules.",
          link: :call,
          image_path: "revel.png",
          type: :pos
        },
        {
          title: "Sage 50",
          description: "Export staff timesheets and leave requests in minutes, eliminating manual data entry and errors.",
          link: :call,
          image_path: "sage.png",
          type: :payroll
        },
        {
          title: "Square",
          description: "Analyze your sales data and predict your staff schedule for better workforce management.",
          link: :call,
          image_path: "square.png",
          type: :pos
        },
        {
          title: "Tenzo",
          description: "Level up your scheduling in Workforce.com with Tenzo’s AI forecasting engine.",
          link: integrations_tenzo_path,
          image_path: "tenzo.png",
          type: :other
        },
        {
          title: "Tevalis",
          description: "Import sales and order data from Tevalis to predict demand for future rostering.",
          link: :call,
          image_path: "tevalis.png",
          type: :pos
        },
        {
          title: "Twice Baked",
          description: "Operational, strategic and technological partnerships to help restaurateurs thrive.",
          link: integrations_twicebaked_path,
          image_path: "twice-baked.png",
          type: :consulting
        },
        {
          title: "Xero",
          description: "Automate data entry and reducing payroll stress with one-click timesheet exports.",
          link: integrations_xero_path,
          image_path: "xero.png",
          type: :payroll
        },
        {
          title: "Zettle",
          description: "Use your Zettle Food & Drink transaction data to write high performing rotas and predict future sales.",
          link: integrations_zettle_path,
          image_path: "zettle.png",
          type: :pos
        },
        {
          title: "Vita Mojo",
          description: "Use your Vita Mojo Food & Drink transaction data to write high performing rotas and predict future sales.",
          link: integrations_vitamojo_path,
          image_path: "VitaMojo.png",
          type: :pos
        }
      ]
    else
      @integrations = [
        {
          title: "ADP",
          link: :call,
          image_path: "adp.png",
          description: "Send approved timesheets in Workforce.com over to payroll in a single click.",
          type: :payroll
        },
        {
          title: "UKG/UltiPro",
          description: "Sync Workforce.com employee data and timesheets to UKG's HRIS and payroll systems.",
          link: :call,
          image_path: "ukg.png",
          type: [:payroll, :hris]
        },
        {
          title: "Gusto",
          description: "Manage your staff with our platform and easily get your payroll done with Gusto.",
          link: :call,
          image_path: "gusto.png",
          type: :payroll
        },
        {
          title: "Oracle",
          description: "Sync Workforce.com employee data and timesheets to Oracles's HRIS and payroll systems.",
          link: :call,
          image_path: "oracle.png",
          type: [:payroll, :hris]
        },
        {
          title: "Workday",
          description: "Sync Workforce.com employee data and timesheets to Workday's HRIS and payroll systems.",
          link: integrations_workday_path,
          image_path: "workday.png",
          type: [:payroll, :hris]
        },
        {
          title: "Ceridian Dayforce",
          description: "Sync Workforce.com employee data and timesheets to Dayforce's HRIS and payroll systems.",
          link: :call,
          image_path: "dayforce.png",
          type: [:payroll, :hris]
        },
        {
          title: "Square",
          description: "Analyze your sales data and predict your staff schedule for better workforce management.",
          link: :call,
          image_path: "square.png",
          type: :pos
        }
      ]
    end

  end

  def workday
  end

  def brightpay
  end

  def xero
  end

  def lightspeed
  end

  def goodtill
  end

  def zettle
  end

  def back_of_house
  end

  def twice_baked
  end

  def icr_touch
  end

  def tenzo
  end

  def vitamojo 
  end

end
