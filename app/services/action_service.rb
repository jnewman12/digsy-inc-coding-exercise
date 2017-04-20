# a generic service to help some non controller/model calls
class ActionService
  def self.get_action
    offset = rand(AgentAction.count)
    rand_action = AgentAction.offset(offset).first
    return rand_action
  end

  # for performing and viewing actions
  def self.action_performed(note, request)
    log = UserLog.new
    log.user = current_user
    log.note = note
    log.browser = request.env['HTTP_USER_AGENT']
    log.ip_address = request.env['REMOTE_ADDR']
    log.controller = controller_name
    log.action = action_name
    log.params = params.inspect
    log.save
  end

  def self.update_aa_performed(aa)
    aa.update(performed: true)
  end

  def self.update_aa_ignored(aa)
    aa.update(ignored: true)
  end
end