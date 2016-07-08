require "spec_helper"

describe BookFinderService do
  subject { BookFinderService.new(query) }

  describe "#library_search_results" do
    context "with complete data and minimal punctuation" do
      let(:query) {"Okorafor"}
      let(:response) {[
        "Who fears death / Nnedi Okorafor.",
        "The Mammoth book of SF stories by women / edited by Alex Dally MacFarlane.",
        "Lagoon / Nnedi Okorafor.",
        "Sisters of the revolution : a feminist speculative fiction anthology / edited by Ann and Jeff VanderMeer.",
        "Binti / Nnedi Okorafor."
      ]}
      it "returns the content of the search page" do
        VCR.use_cassette('alamedafree/library_search_results_okorafor') do
          expect(subject.library_search_results).to eq response
        end
      end   
    end

    context "when library website is unreachable" do
      let(:query) {"Time Out"}
      before { WebMock.disable_net_connect! }
      
      it "returns the content of the search page" do
        expect(subject.library_search_results).to be false
      end 
    end
  end
end