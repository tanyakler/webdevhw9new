#!/bin/bash

export MIX_ENV=prod
export PORT=4977

CFGD=$(readlink -f ~/.config/events)

if [ ! -e "$CFGD/base" ]; then

	echo "run deploy first"
	exit 1
fi

DB_PASS=$(cat "$CFGD/db_pass")
export DATABASE_URL=ecto://eventsspa:$DB_PASS@localhost/events_dev

SECRET_KEY_BASE=$(cat "$CFGD/base")
export SECRET_KEY_BASE

_build/prod/rel/events/bin/events start
