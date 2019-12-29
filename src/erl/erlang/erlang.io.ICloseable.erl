-module('erlang.io.ICloseable').

-include("clojerl.hrl").
-include("clojerl_int.hrl").

-clojure(true).
-protocol(true).

-export(['close'/1]).
-export([?SATISFIES/1]).
-export([?EXTENDS/1]).

-callback 'close'(any()) -> any().
-optional_callbacks(['close'/1]).

'close'(X) ->
  case X of
    #{?TYPE := 'clojerl.Agent'} ->
      'clojerl.Agent':'close'(X);
    #{?TYPE := 'clojerl.Delay'} ->
      'clojerl.Delay':'close'(X);
    #{?TYPE := 'clojerl.Future'} ->
      'clojerl.Future':'close'(X);
    #{?TYPE := 'clojerl.Promise'} ->
      'clojerl.Promise':'close'(X);
    #{?TYPE := 'erlang.io.File'} ->
      'erlang.io.File':'close'(X);
    #{?TYPE := 'erlang.io.PushbackReader'} ->
      'erlang.io.PushbackReader':'close'(X);
    #{?TYPE := 'erlang.io.StringReader'} ->
      'erlang.io.StringReader':'close'(X);
    #{?TYPE := 'erlang.io.StringWriter'} ->
      'erlang.io.StringWriter':'close'(X);
    #{?TYPE := _} ->
      clj_protocol:not_implemented(?MODULE, 'close', X);
    X_ when erlang:is_binary(X_) ->
      clj_protocol:not_implemented(?MODULE, 'close', X);
    X_ when erlang:is_boolean(X_) ->
      clj_protocol:not_implemented(?MODULE, 'close', X);
    ?NIL ->
      clj_protocol:not_implemented(?MODULE, 'close', X);
    _ ->
      clj_protocol:not_implemented(?MODULE, 'close', X)
  end.

?SATISFIES(X) ->
  case X of
    #{?TYPE := 'clojerl.Agent'} ->  true;
    #{?TYPE := 'clojerl.Delay'} ->  true;
    #{?TYPE := 'clojerl.Future'} ->  true;
    #{?TYPE := 'clojerl.Promise'} ->  true;
    #{?TYPE := 'erlang.io.File'} ->  true;
    #{?TYPE := 'erlang.io.PushbackReader'} ->  true;
    #{?TYPE := 'erlang.io.StringReader'} ->  true;
    #{?TYPE := 'erlang.io.StringWriter'} ->  true;
    #{?TYPE := _} ->  false;
    X_ when erlang:is_binary(X_) ->  false;
    X_ when erlang:is_boolean(X_) ->  false;
    ?NIL ->  false;
    _ -> false
  end.

?EXTENDS(X) ->
  case X of
    'clojerl.Agent' -> true;
    'clojerl.Delay' -> true;
    'clojerl.Future' -> true;
    'clojerl.Promise' -> true;
    'erlang.io.File' -> true;
    'erlang.io.PushbackReader' -> true;
    'erlang.io.StringReader' -> true;
    'erlang.io.StringWriter' -> true;
    _ -> false
  end.
