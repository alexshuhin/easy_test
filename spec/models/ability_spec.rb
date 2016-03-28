require 'rails_helper'

describe Ability do
  subject(:ability) { Ability.new(user) }

  describe Post do
    context 'user is not logged_in' do
      let(:user) { nil }

      it 'should be not able to create' do
        expect(subject).to_not be_able_to :create, Post
      end
    end

    context 'user logged on' do
      let(:user) { create :user }

      it 'should be able to create' do
        expect(subject).to be_able_to :create, Post
      end

      context 'created by another user' do
        let(:post) { create :post }

        it 'should be able to read' do
          expect(subject).to be_able_to :read, post
        end

        it 'should be not able to update' do
          expect(subject).to_not be_able_to :update, post
        end

        it 'should be not able to destroy' do
          expect(subject).to_not be_able_to :destroy, post
        end
      end

      context 'created by himself' do
        let(:post) { create :post, author: user }

        it 'should be able to read' do
          expect(subject).to be_able_to :read, post
        end

        it 'should be not able to edit' do
          expect(subject).to be_able_to :update, post
        end

        it 'should be not able to destroy' do
          expect(subject).to be_able_to :destroy, post
        end
      end
    end
  end

  describe Comment do
    context 'user is not logged_in' do
      let(:user) { nil }

      it 'should be not able to create comment' do
        expect(subject).to_not be_able_to :create, Comment
      end
    end

    context 'user logged on' do
      let(:user) { create :user }

      it 'should be able to create comment' do
        expect(subject).to be_able_to :create, Comment
      end

      context 'created by another user' do
        let(:comment) { create :comment }

        it 'should be able to update' do
          expect(subject).to_not be_able_to :update, comment
        end

        it 'should be able to destroy' do
          expect(subject).to_not be_able_to :destroy, comment
        end
      end

      context 'just created by himself' do
        let(:comment) { create :comment, author: user }

        it 'should be not able to update' do
          expect(subject).to be_able_to :update, comment
        end

        it 'should be not able to destroy' do
          expect(subject).to be_able_to :destroy, comment
        end
      end

      context 'created 15 minutes ago' do
        let(:comment) { create :comment, author: user,
                        created_at: DateTime.now - 15.minutes }

        it 'should be not able to update' do
          expect(subject).to_not be_able_to :update, comment
        end

        it 'should be not able to destroy' do
          expect(subject).to_not be_able_to :destroy, comment
        end
      end
    end
  end
end
