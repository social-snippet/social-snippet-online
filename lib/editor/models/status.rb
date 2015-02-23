module Editor::Models

  require "ideone"

  # Ideone's submission status
  class Status

    include ::Mongoid::Document
    
    field :token,   :type => String
    field :status,  :type => Integer
    field :result,  :type => Integer
    field :input,   :type => String
    field :output,  :type => String
    field :memory,  :type => Integer
    field :signal,  :type => Integer
    field :compile_info, :type => String

    has_one :source, :class_name => "::Editor::Models::Source"

    def self.submit(source_id)
      source = Source.find(source_id)
      ideone = ::Ideone.new(IDEONE_API_ID, IDEONE_API_PW)
      token  = ideone.create_submission(source.text, source.language)
      details = {}

      3.times do
        status = ideone.submission_status(token)
        break unless status["status"].to_i == STATUS_DONE
        sleep 3
      end

      5.times do
        details = ideone.submission_details(token)
        break unless details["result"].to_i == RESULT_NOT_RUNNING
        sleep 3
      end

      status = Status.create!(:token  => token)
      status.update_attributes!(
        :status => details["status"].to_i,
        :result => details["result"].to_i,
        :input  => details["input"],
        :output => details["output"],
        :memory => details["memory"].to_i,
        :signal => details["signal"].to_i,
        :compile_info => details["cmpinfo"],
      )
      status
    end

    private

    IDEONE_API_ID = ENV["IDEONE_API_ID"]
    IDEONE_API_PW = ENV["IDEONE_API_PW"]

    STATUS_IN_QUEUE     = -1
    STATUS_DONE         = 0
    STATUS_COMPILATION  = 1
    STATUS_RUNNING      = 3

    RESULT_NOT_RUNNING            = 0
    RESULT_COMPILATION_ERROR      = 11
    RESULT_RUNTIME_ERROR          = 12
    RESULT_TIME_LIMIT_EXCEEDED    = 13
    RESULT_SUCCESS                = 15
    RESULT_MEMORY_LIMIT_EXCEEDED  = 17
    RESULT_ILLEGAL_SYSTEM_CALL    = 19
    RESULT_INTERNAL_ERROR         = 20

    LANGUAGE_ADA                     = 7
    LANGUAGE_ASSEMBLER               = 13
    LANGUAGE_ASSEMBLER               = 45
    LANGUAGE_AWK_GAWK                = 104
    LANGUAGE_AWK_MAWK                = 105
    LANGUAGE_BASH                    = 28
    LANGUAGE_BC                      = 110
    LANGUAGE_BRAINF__K               = 12
    LANGUAGE_C                       = 11
    LANGUAGE_CSHARP                  = 27
    LANGUAGE_CPP_4_3_2               = 41
    LANGUAGE_CPP_4_9_2               = 1
    LANGUAGE_CPP14                   = 44
    LANGUAGE_C99_STRICT              = 34
    LANGUAGE_CLIPS                   = 14
    LANGUAGE_CLOJURE                 = 111
    LANGUAGE_COBOL                   = 118
    LANGUAGE_COBOL_85                = 106
    LANGUAGE_COMMON_LISP_CLISP       = 32
    LANGUAGE_D                       = 20
    LANGUAGE_D_DMD                   = 102
    LANGUAGE_ERLANG                  = 36
    LANGUAGE_FSHARP                  = 124
    LANGUAGE_FACTOR                  = 123
    LANGUAGE_FALCON                  = 125
    LANGUAGE_FORTH                   = 107
    LANGUAGE_FORTRAN                 = 5
    LANGUAGE_GO                      = 114
    LANGUAGE_GROOVY                  = 121
    LANGUAGE_HASKELL                 = 21
    LANGUAGE_ICON                    = 16
    LANGUAGE_INTERCAL                = 9
    LANGUAGE_JAVA                    = 10
    LANGUAGE_JAVA7                   = 55
    LANGUAGE_JAVASCRIPT_RHINO        = 35
    LANGUAGE_JAVASCRIPT_SPIDERMONKEY = 112
    LANGUAGE_LUA                     = 26
    LANGUAGE_NEMERLE                 = 30
    LANGUAGE_NICE                    = 25
    LANGUAGE_NIMROD                  = 122
    LANGUAGE_NODE_JS                 = 56
    LANGUAGE_OBJECTIVE_C             = 43
    LANGUAGE_OCAML                   = 8
    LANGUAGE_OCTAVE                  = 127
    LANGUAGE_OZ                      = 119
    LANGUAGE_PARI_GP                 = 57
    LANGUAGE_PASCAL_FPC              = 22
    LANGUAGE_PASCAL_GPC              = 2
    LANGUAGE_PERL                    = 3
    LANGUAGE_PERL_6                  = 54
    LANGUAGE_PHP                     = 29
    LANGUAGE_PIKE                    = 19
    LANGUAGE_PROLOG_GNU              = 108
    LANGUAGE_PROLOG_SWI              = 15
    LANGUAGE_PYTHON                  = 4
    LANGUAGE_PYTHON_PYPY             = 99
    LANGUAGE_PYTHON_3                = 116
    LANGUAGE_R                       = 117
    LANGUAGE_RUBY                    = 17
    LANGUAGE_SCALA                   = 39
    LANGUAGE_SCHEME_CHICKEN          = 128
    LANGUAGE_SCHEME_GUILE            = 33
    LANGUAGE_SMALLTALK               = 23
    LANGUAGE_SQL                     = 40
    LANGUAGE_TCL                     = 38
    LANGUAGE_TEXT                    = 62
    LANGUAGE_UNLAMBDA                = 115
    LANGUAGE_VB_NET                  = 101
    LANGUAGE_WHITESPACE              = 6

  end

end
