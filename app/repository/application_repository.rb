# frozen_string_literal: true
# TODO: ERROR CATCHING
# @author Jan Hummel, Carlo Bortolan
# This class communicates directly with the db and sends SQL requests
class ApplicationRepository
  # Client parameter müssen manuell angepasst werden

  def insert_notification (job_id, employer_id, new_value)
    query = "INSERT INTO notifications VALUES( '#{(new_value ? 1 : 0)}',#{job_id},#{employer_id})"
    binds = [ActiveRecord::Relation::QueryAttribute.new('new_value', new_value, ActiveRecord::Type::Boolean.new),
             ActiveRecord::Relation::QueryAttribute.new('job_id', job_id, ActiveRecord::Type::Integer.new),
             ActiveRecord::Relation::QueryAttribute.new('employer_id', employer_id, ActiveRecord::Type::Integer.new)]
    ApplicationRecord.connection.exec_query(query, 'SQL', binds, prepare: true)
  end

  def update_notification (job_id, employer_id, new_value)
    query = "UPDATE notifications SET notify = '#{(new_value ? 1 : 0)}' WHERE job_id = #{job_id} AND employer_id = #{employer_id}"
    binds = [ActiveRecord::Relation::QueryAttribute.new('new_value', new_value, ActiveRecord::Type::Boolean.new),
             ActiveRecord::Relation::QueryAttribute.new('job_id', job_id, ActiveRecord::Type::Integer.new),
             ActiveRecord::Relation::QueryAttribute.new('employer_id', employer_id, ActiveRecord::Type::Integer.new)]
    ApplicationRecord.connection.exec_query(query, 'SQL', binds, prepare: true)
  end

  def get_notification (job_id, employer_id)
    query = "SELECT notify FROM notifications WHERE job_id = #{job_id} AND employer_id = #{employer_id}"
    binds = [ActiveRecord::Relation::QueryAttribute.new('job_id', job_id, ActiveRecord::Type::Integer.new),
             ActiveRecord::Relation::QueryAttribute.new('employer_id', employer_id, ActiveRecord::Type::Integer.new)]
    ApplicationRecord.connection.exec_query(query, 'SQL', binds, prepare: true).rows[0]
  end

  def find_employer_id (job_id)
    query = "SELECT id FROM jobs WHERE job_id = #{job_id}"
    binds = [ActiveRecord::Relation::QueryAttribute.new('job_id', job_id, ActiveRecord::Type::Integer.new)]
    ApplicationRecord.connection.exec_query(query, 'SQL', binds, prepare: true).rows[0]
  end

  def find_user(id)
    query = "SELECT id, first_name, last_name, email FROM users WHERE id = #{id}"
    binds = [ActiveRecord::Relation::QueryAttribute.new('id', id, ActiveRecord::Type::Integer.new)]
    result = ApplicationRecord.connection.exec_query(query, 'SQL', binds, prepare: true).rows[0]
    { :name => result[1].to_s.concat(" #{result[2].to_s}"), :email => result[3].to_s }
  end

  # @deprecated
  def remove_old_applications (date_to)
    # remove all unanswered or rejected applications for a job with a due date before date_to
    # TODO:
  end

  def create_application (job_id, id, text, documents)
    # create new application as Application: {(job_id, id), text, status, response}
    @application = ApplicationRecord.connection.query("INSERT INTO applications(job_id, user_id, application_text, application_documents, updated_at, applied_at) VALUES (#{job_id}, #{id}, '#{text}', '#{documents}', '#{Time.now}', '#{Time.now}')")
    # query = "INSERT INTO applications(job_id, applicant_id, application_text, application_documents) VALUES (#{job_id}, #{id}, '#{text}', '#{documents}')"
    # binds = [ActiveRecord::Relation::QueryAttribute.new('job_id', job_id, ActiveRecord::Type::Integer.new),
    #          ActiveRecord::Relation::QueryAttribute.new('id', id, ActiveRecord::Type::Integer.new),
    #          ActiveRecord::Relation::QueryAttribute.new('text', text, ActiveRecord::Type::Text.new),
    #          ActiveRecord::Relation::QueryAttribute.new('documents', documents, ActiveRecord::Type::String.new)]
    # ApplicationRecord.connection.exec_query(query, 'SQL', binds, prepare: true).rows[0]
  end

  def change_status (job_id, id, new_status, response)
    # change status to -1/0/1;
    # add response
    query = "UPDATE applications SET status = '#{new_status}', response = '#{response}' WHERE job_id = #{job_id} AND user_id = #{id }"
    binds = [ActiveRecord::Relation::QueryAttribute.new('job_id', job_id, ActiveRecord::Type::Integer.new),
             ActiveRecord::Relation::QueryAttribute.new('id', id, ActiveRecord::Type::Integer.new),
             ActiveRecord::Relation::QueryAttribute.new('new_status', new_status, ActiveRecord::Type::String.new),
             ActiveRecord::Relation::QueryAttribute.new('response', response, ActiveRecord::Type::String.new)]
    ApplicationRecord.connection.exec_query(query, 'SQL', binds, prepare: true).rows[0]
  end

  def reject_all (job_id, response)
    # change status to -1 for all with current status 0;
    # add response
    query = "UPDATE applications SET status = '-1', response = '#{response}' WHERE job_id = #{job_id} AND status <> '1'"
    binds = [ActiveRecord::Relation::QueryAttribute.new('job_id', job_id, ActiveRecord::Type::Integer.new),
             ActiveRecord::Relation::QueryAttribute.new('response', response, ActiveRecord::Type::String.new)]
    ApplicationRecord.connection.exec_query(query, 'SQL', binds, prepare: true).rows[0]

    # ActiveRecord::Base.connection.execute("UPDATE applications SET status = '-1', response = '#{response}' WHERE job_id = #{job_id} AND status <> '1'")
  end

  def find_by_user(id)
    query = "SELECT * FROM applications WHERE user_id = #{id} ORDER BY applied_at DESC"
    binds = [ActiveRecord::Relation::QueryAttribute.new('id', id, ActiveRecord::Type::Integer.new)]
    ApplicationRecord.connection.exec_query(query, 'SQL', binds, prepare: true).rows
  end

end
