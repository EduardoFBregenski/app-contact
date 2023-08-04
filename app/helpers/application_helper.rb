module ApplicationHelper
    def format_cep(cep)
        cep.to_s.gsub(/(\d{5})(\d{3})/, '\\1-\\2')
    end
end
