#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for bsc"

  set -- bsc "$@"
fi

if [ "$1" = "bsc" ]; then

  if [ ! -d $BSC_DATADIR/geth/chaindata ]; then
    echo "$0: creating $BSC_DATADIR"
    mkdir -p "$BSC_DATADIR"
    chmod 700 "$BSC_DATADIR"
    echo "$0: initiating blockchain"
    bsc --datadir "$BSC_DATADIR" init /genesis.json
		echo "$0: setting data directory to $BSC_DATADIR"
  fi

  if [ ! -f $BSC_DATADIR/config.toml ]; then
    mkdir -p "$BSC_DATADIR"
    chmod 700 "$BSC_DATADIR"
    echo "$0: copying config.toml to $BSC_DATADIR/"
    cp /config.toml $BSC_DATADIR/
		echo "$0: setting data directory to $BSC_DATADIR"
  fi
	
  set -- "$@" --datadir "$BSC_DATADIR" --config "$BSC_DATADIR/config.toml" $OPTS_1 --syncmode $SYNC_MODE --gcmode $GC_MODE --txlookuplimit $TX_LOOKUP_LIMIT --http.api $HTTP_API --http.corsdomain $HTTP_CORS_DOMAIN --ws.api $WS_API --ws.origins $WS_ORIGINS --graphql.corsdomain $GRAPH_QL_CORS_DOMAIN --identity $IDENTITY --graphql.vhosts $GRAPH_QL_V_HOSTS $OPTS_2

fi

echo
exec "$@"
